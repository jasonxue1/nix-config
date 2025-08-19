#!/bin/bash
set -euo pipefail

cpu_usage=$(
  top -l 1 -n 0 | awk '
    /CPU usage/ {
      # 优先用 idle
      if (match($0, /[0-9.]+% idle/)) {
        s = substr($0, RSTART, RLENGTH)
        gsub(/[^0-9.]/, "", s)   # 只留数字和点
        idle = s + 0
        printf("%.1f%%", 100 - idle); exit
      }
      # 兼容某些行没有 idle 的情况：user+sys(+nice)
      u=s=n=0
      if (match($0, /[0-9.]+% user/)) { t=substr($0, RSTART, RLENGTH); gsub(/[^0-9.]/,"",t); u=t+0 }
      if (match($0, /[0-9.]+% sys/ )) { t=substr($0, RSTART, RLENGTH); gsub(/[^0-9.]/,"",t); s=t+0 }
      if (match($0, /[0-9.]+% nice/)) { t=substr($0, RSTART, RLENGTH); gsub(/[^0-9.]/,"",t); n=t+0 }
      printf("%.1f%%", u+s+n); exit
    }'
)

mem_usage=$(
  vm_stat | awk '
    /Pages active/                 {a=$3+0}
    /Pages inactive/               {i=$3+0}
    /Pages speculative/            {s=$3+0}
    /^Pages wired:/                {w=$3+0}
    /Pages wired down/             {w=$4+0}
    /Pages free/                   {f=$3+0}
    /Pages occupied by compressor/ {c=$5+0}
    END {
      total=a+i+s+w+f+c
      if (total==0) { print "0.0%"; exit }
      used=total - f
      printf("%.1f%%\n", 100*used/total)
    }'
)

temp=$(osx-cpu-temp)

echo "CPU: $cpu_usage | MEM: $mem_usage | TEMP: $temp"
