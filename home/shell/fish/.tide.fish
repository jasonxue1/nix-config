#!/usr/bin/env fish
tide configure --auto \
    --style=Rainbow \
    --prompt_colors='True color' \
    --show_time=No \
    --rainbow_prompt_separators=Slanted \
    --powerline_prompt_heads=Slanted \
    --powerline_prompt_tails=Slanted \
    --powerline_prompt_style='Two lines, character and frame' \
    --prompt_connection=Solid \
    --powerline_right_prompt_frame=Yes \
    --prompt_connection_andor_frame_color=Lightest \
    --prompt_spacing=Sparse --icons='Many icons' \
    --transient=No
