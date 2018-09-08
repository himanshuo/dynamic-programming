set -eu

PROJECT_NAME=$1
CLASS_NAME=$2
FUNCTION_NAME=$3

# 0. Validate input
if [ -d "$PROJECT_NAME" ]; then
  echo "$PROJECT_NAME already exists. Choose another name"
  exit
fi

if ! [[ "$CLASS_NAME" =~ (^[A-Z][a-zA-Z]+$) ]]; then
  echo "Invalid Class Name. Must be camelcase"
  exit
fi

if ! [[ "$FUNCTION_NAME" =~ ^[a-z]+$ ]]; then
  echo "Invalid Function Name. Can only be lower case letters. no underscore."
  exit
fi

# 1. Copy/Paste sample files
cp -R template $PROJECT_NAME

# 2. Edit files to use provided project, class, and function name
mv "$PROJECT_NAME/src/Template.hs" "$PROJECT_NAME/src/$CLASS_NAME.hs"

sed -i '' "s/Template/$CLASS_NAME/" "$PROJECT_NAME/package.yaml"
sed -i '' "s/Template/$CLASS_NAME/" "$PROJECT_NAME/test/Tests.hs"
sed -i '' "s/Template/$CLASS_NAME/" "$PROJECT_NAME/src/$CLASS_NAME.hs"

sed -i '' "s/template/$FUNCTION_NAME/" "$PROJECT_NAME/package.yaml"
sed -i '' "s/template/$FUNCTION_NAME/" "$PROJECT_NAME/test/Tests.hs"
sed -i '' "s/template/$FUNCTION_NAME/" "$PROJECT_NAME/src/$CLASS_NAME.hs"

# 3. Go to Directory
cd "$PROJECT_NAME"

# 4. setup stack
stack init

# 5. Setup Git

# 6. Come back to original directory
cd ../

# 7. Provide commands for user to use stack
echo ""
echo ""
echo "===============SUCCESS====================="
echo "Run Tests using: stack test"
echo "Run haskell repl using: stack ghci"
echo "===============SUCCESS====================="


