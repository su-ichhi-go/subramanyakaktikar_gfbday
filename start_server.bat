@echo off
echo Starting local server for birthday website...
echo.
echo The website will be available at: http://localhost:8000/index.html
echo.
echo Press Ctrl+C to stop the server
echo.
python -m http.server 8000
pause