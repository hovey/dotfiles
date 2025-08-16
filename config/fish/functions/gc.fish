function gc
    if test (count $argv) -eq 0
        echo "Usage: gc \"commit message\""
    else
        git commit -m "$argv"
    end
end

