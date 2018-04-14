. $PSScriptRoot\voiceConverter.ps1

function ConvertTo-Voice {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('show', 'haruka', 'hikari', 'takeru', 'santa', 'bear')]
        [string] $name,
        [Parameter(Mandatory)]
        [string] $text
        )
    begin{
    }
    process {
        Write-Host $PSScriptRoot
        $Speaker = [Speaker]::new($name, $text);
        $Speaker.Speak();
    }
    end {
    }
}