Write-Host 'Loading...'

class Speaker {
    [string]$Name;
    [string]$Text;
    [string]$Uri = "https://api.voicetext.jp/v1/tts";
    
    Speaker ($name, $text) {
        $this.Name = $name;
        $this.Text = $text;
    }

    [string] GetAuthorization() {
        $t = $env:VoiceTextAPI_KEY + ":";
        return "Basic " `
            + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($t))
    }

    [void] Speak() {
        $outFile = ".\voicetext.wav"
        if (Test-Path $outFile){
            Remove-Item $outFile;
        }
    
        Invoke-RestMethod -Uri $this.Uri `
                    -Method POST `
                    -Headers @{Authorization=$this.GetAuthorization()} `
                    -Body @{text=$this.Text; speaker=$this.Name;} `
                    -OutFile $outFile;

        $player = New-Object System.Media.SoundPlayer -ArgumentList $outFile
        $player.Play()
    }
}