function verifyImageDir( imageDir )
    if exist(imageDir, 'dir') == 0 
       error('Error: Image directory set incorrectly'); 
    end
end

