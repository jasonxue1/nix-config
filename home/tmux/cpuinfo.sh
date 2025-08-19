#!/bin/bash
set -euo pipefail

# CPU：从 "NN.N% idle" 抠出数字，用 100-idle 得到使用率；不依赖 gawk 的第三参 match
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

# MEM：vm_stat 轻量；把压缩内存算进已用
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

# 温度：工具存在就用，不在就 N/A
if command -v osx-cpu-temp >/dev/null 2>&1; then
  temp=$(osx-cpu-temp)
else
  temp="N/A"
fi

echo "CPU: $cpu_usage | MEM: $mem_usage | TEMP: $temp"
