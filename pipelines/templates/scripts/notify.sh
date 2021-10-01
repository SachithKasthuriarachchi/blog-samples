body=$(cat << EOF
{
  "cards": [
    {
      "header": {
        "title": "End-to-End Test Results Available",
        "imageUrl": "https://img.icons8.com/ios/50/000000/test-results.png"
      },
      "sections": [
         {
           "widgets": [
              {
                "keyValue": {
                  "topLabel": "Pipeline Build Number",
                  "content": "$(Build.BuildNumber)",
                  "button": {
                    "textButton": {
                      "text": "View",
                      "onClick": {
                        "openLink": {
                          "url": "https://dev.azure.com/choreo-devops/$(System.TeamProject)/_build/results?buildId=$(Build.BuildId)&view=logs"
                        }
                      }
                    }
                  }
                }
              }
            ]
          }
        ]
      }
    ]
  }
EOF
)
curl \
  -X POST \
  -H 'Content-Type: application/json' \
  "${{ parameters.WEBHOOK_URL }}" \
  -d "$body"
