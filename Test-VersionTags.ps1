function Test-VersionTags {
    PROCESS {
        $Pattern = "v[0-9]+\.[0-9]+\.[0-9]+"
        $AllTags = (git tag --list)
        if ($null -eq $AllTags){
            write-output "There are no tags"
            exit 1
        }else{
            foreach ($Tag in $AllTags){
            if ($Tag -match $Pattern){
                write-output "$Tag is valid"
            }else {
                write-output "$Tag invalid. Tags must follow the format 'vMajor.Minor.Fix'. E.G. v1.23.45"
                exit 1
            }
            }
        }
    }
}

Test-VersionTags