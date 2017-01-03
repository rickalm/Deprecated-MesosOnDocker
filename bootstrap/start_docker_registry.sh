docker run -d -p 5000:5000 --restart=always --name registry \
  -v $(pwd)/data:/var/lib/registry \
  registry:2
