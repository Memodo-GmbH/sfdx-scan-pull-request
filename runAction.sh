#!/bin/bash -v

# Check if Deno 2.0.0 is installed
deno_version=$(deno --version 2>&1 | grep "deno" | awk '{print $2}')

if [[ "$deno_version" != "2.0.0" ]]; then
  echo "Deno 2.0.0 is not installed. Installing now..."
  # Install Deno 2.0.0 (replace with your preferred installation method)
  curl -fsSL https://deno.land/install.sh | sh
  echo "Deno 2.0.0 installed successfully."
else
  echo "Deno 2.0.0 is already installed."
fi

export PATH="$PATH:/home/runner/.deno/bin" 

deno install --allow-scripts

deno run --allow-env --allow-read --allow-run ${GITHUB_ACTION_PATH}/src/index.ts
