#!/usr/bin/awk -f

BEGIN {
    FS = "|"
    max_duration = -1
}

/^[[:space:]]*#/ || NF < 8 { next }

{
    for (i = 1; i <= NF; i++) {
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", $i)
    }

    destination = $3
    status = $4
    duration = $6 + 0  # convert to number
    code = $8

    if (destination == "Mars" && status == "Completed") {
        if (duration > max_duration) {
            max_duration = duration
            best_code = code
        }
    }
}

END {
    print best_code
}
