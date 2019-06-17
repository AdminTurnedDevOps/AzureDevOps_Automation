function Get-AZDevOpsBuildInfo {
    [cmdletbinding(SupportsShouldProcess, DefaultParameterSetName = 'newBuildSearchResult', ConfirmImpact = 'low')]
    param(
        [parameter(Mandatory,
            Position = 0,
            HelpMessage = 'Please enter the URL to your orgs Azure DevOps primary account',
            ValueFromPipeline,
            ParameterSetName = 'newBuildSearchResult')]
        [ValidateNotNullOrEmpty()]
        [Alias('ORGURL')]
        [string]
        $org,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the project that you want to pull build results from',
            ParameterSetName = 'newBuildSearchResult')]
        [ValidateNotNullOrEmpty()]
        [string]
        $project
    
    )

    PROCESS {
        try {
            $buildResults = az pipelines build list --org $org --project $project
            $convertbuildResults = $buildResults | ConvertFrom-Json

            $convertbuildResults | Select-Object buildNumber, startTime, lastChangedDate, result | fl
        }

        catch {
            Write-Warning 'An error has occured'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

}