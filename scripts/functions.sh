#!/bin/bash

# Function to edit config
edit_config() {
    hx ~/scripts/ ~/.config/wezterm/.wezterm.lua ~/AppData/Roaming/helix/config.toml ~/AppData/Roaming/helix/languages.toml 
}

# Function to rename the vtt to Français
rename_vtt() {
    fd -e vtt -x mv {} {//}/Français.vtt
}

# Function to get the txt from a text file
get_desc() {
    nvim -c 'normal ggVG"+y' -c 'q!' "$1"*.txt
}

# Function to resize and crop JPEG images to a 16:9 aspect ratio
resize_and_crop_16_9() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: resize_and_crop_16_9 <input_pattern>"
    return 1
  fi

  local input_pattern="$1"
  local aspect_width=16
  local aspect_height=9
  local tinyfy_api_key="34dHP13t1mXFPmxF1QPHjM7Fp5znrWWP"  # Replace with your Tinyfy API key

  for file in $input_pattern; do
    if [ ! -f "$file" ]; then
      echo "File $file does not exist."
      continue
    fi

    local dimensions
    dimensions=$(magick identify -format "%wx%h" "$file")
    local orig_width
    local orig_height
    IFS='x' read -r orig_width orig_height <<< "$dimensions"

    local target_width
    local target_height

    if [ "$orig_width" -ge "$orig_height" ]; then
      target_height=$((orig_width * aspect_height / aspect_width))
      if [ "$target_height" -gt "$orig_height" ]; then
        target_height=$orig_height
        target_width=$((orig_height * aspect_width / aspect_height))
      else
        target_width=$orig_width
      fi
    else
      target_width=$((orig_height * aspect_width / aspect_height))
      if [ "$target_width" -gt "$orig_width" ]; then
        target_width=$orig_width
        target_height=$((orig_width * aspect_height / aspect_width))
      else
        target_height=$orig_height
      fi
    fi

    local pad_width=$(( (target_width - orig_width) / 2 ))
    local pad_height=$(( (target_height - orig_height) / 2 ))

    temp_file=$(mktemp)
    magick "$file" -resize "${target_width}x${target_height}>" -background white -gravity center "$temp_file"

    response=$(curl -s -D - --user api:$tinyfy_api_key --data-binary @$temp_file https://api.tinify.com/shrink)

    echo "Response headers:"
    echo "$response" | grep -E '^(HTTP/|Location:)'

    compressed_url=$(echo "$response" | grep -i "Location:" | awk '{print $2}' | tr -d '\r')

    if [ -z "$compressed_url" ]; then
      echo "Error: Failed to get compressed image URL for $file"
      rm "$temp_file"
      continue
    fi

    curl -s --user api:$tinyfy_api_key "$compressed_url" --output "$file"
    
    rm "$temp_file"
    echo "Processed and compressed $file"
  done
}

