@echo off
for %%a in (*.gif) do (
    powershell -Command "& {
        $file = '%%a';
        $image = [System.Drawing.Image]::FromFile($file);
        if ($image) {
            $resized = New-Object System.Drawing.Bitmap 225, 127;
            if ($resized) {
                $graphics = [System.Drawing.Graphics]::FromImage($resized);
                if ($graphics) {
                    $graphics.DrawImage($image, 0, 0, 225, 127);
                    $resized.Save($file);
                    $graphics.Dispose();
                }
                $resized.Dispose();
            }
            $image.Dispose();
        }
    }"
)
pause
