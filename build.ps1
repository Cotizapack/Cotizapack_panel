flutter build web --release

Rename-Item .\build\web -NewName docs 
Remove-Item -Path .\docs -Force
Move-Item -Path .\build\docs -Destination .\docs -Force