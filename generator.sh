#!/bin/bash
myyear=$(date +'%Y')
read -p 'Project name: ' projectname
read -p 'Project description: ' projectdescription
read -p 'Author full name: ' authorfullname
read -p 'Author github username: ' authorgithubusername
read -p 'License: ' license

tools=()
IFS=''
read -p "Insert first used tool/framework/library name (or leave empty):" word
while true; do
    if [ -z $word ]; then
        break
    fi

    tools+=($word)
    read -p "Insert next used tool/framework/library name (or leave empty):" word
done

# Header
echo "
# **:triangular_flag_on_post: $projectname**

![project version](https://img.shields.io/badge/project-0.0.1-brightgreen.svg)

> $projectdescription

---
"

# Tools
if [ ${#tools[@]} -gt 0 ]; then
    echo "## **:package: Main tools used**"
    echo ""

    for tool in "${tools[@]}"; do
        echo - [x] $tool
    done

    echo ""
    echo "---"
fi

# Installation, run and other stuff
echo "

## **:wrench: Developer usage**

### **Installation**

In order to install the project and all dependencies, enter in the project folder and run \`install\`

#### Configuration

Update your configuration file
\`\`\`
PROPERTY1=value1
PROPERTY2=value2
PROPERTY3=value3
\`\`\`

Then run the config script:
\`\`\`sh
config project
\`\`\`

---

### Start the project

\`\`\`bash
start
\`\`\`

### Test the project

\`\`\`bash
test
\`\`\`

---

## **:handshake: Contributing**

- Fork it!
- Create your feature branch: \`git checkout -b feature/my-new-feature\`
- Commit your changes: \`git commit -am 'Add some feature'\`
- Push to the branch: \`git push origin feature/my-new-feature\`
- Submit a pull request

---

### **:heart: Show your support**

Please :star: this repository if you like it or this project helped you!\
Feel free to open issues or submit pull-requests to help me improving my work.

---

### **:scroll: Release history**

* 0.0.1
    * Work in progress

---

### **:robot: Author**

_*$authorfullname*_

> You can follow me on
[GitHub](https://github.com/$authorgithubusername)

---

Copyright © $myyear [$authorfullname](https://github.com/$authorgithubusername).
License [$license](LICENSE).
"
