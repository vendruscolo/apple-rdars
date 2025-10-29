UICornerConfiguration is not working correctly on older devices that have a smaller display corner radius.

Steps to reproduce:
1. Launch the attached sample project on a 3rd generation iPad Pro (simulator is fine)
2. Resize the window to full screen (which will have a reduced corner radius)
3. Make the window smaller (which will increase the window corner radius)
4. Resize the window back to full screen (which will reduce the window corner radius once more)

Expected behavior:
The view is all red.

Result:
The red view have a bigger corner radius (it retains the smaller window corner radius from step 3) revealing the white background of window.