#!/bin/bash

curl "http://localhost:4741/proposals" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "proposals": {
      "project_title": "'"${TITLE}"'",
      "question_one": "'"${QUESTION_ONE}"'",
      "question_two": "'"${QUESTION_TWO}"'",
      "question_three": "'"${QUESTION_THREE}"'"
    }
  }'

echo
