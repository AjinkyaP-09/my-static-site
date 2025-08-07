#!/bin/bash
echo "🚀 Deploying website..."
rsync -avz -e "ssh -i /home/apame09/demo.pem" ./my-static-site/ ubuntu@13.127.11.176:/var/www/mywebsite.com/html/
echo "✅ Deployment complete!"
