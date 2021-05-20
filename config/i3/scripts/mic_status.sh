amixer get Capture | grep '\[off\]' >> /dev/null && echo "OFF" || echo "ON"
