function New-AZDevOpsBuild {
    [cmdletbinding(SupportsShouldProcess, DefaultParameterSetName = 'newBuild', ConfirmImpact = 'high')]
    param(
        [parameter(Mandatory,
            Position = 0,
            HelpMessage = 'Please enter the name of your new build',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildName')]
        [string]
        $name,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the project name of your new build',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('projectName')]
        [string]
        $project,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the description of your new build',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildDescription')]
        [string]
        $description,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the source control repo to point to for your new build',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildRepo')]
        [string]
        $repository,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the source control repo type (tfsgit, git, etc.)',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildRepoType')]
        [string]
        $repoType,

        [parameter(Mandatory,
            HelpMessage = 'Please enter the source control branch (master, dev, etc.)',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildRepoBranch')]        
        [string]
        $branch,

        [parameter(Mandatory,
            HelpMessage = 'Please enter your org (URL to your dev.azure.com env)',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [ValidateNotNullOrEmpty()]
        [Alias('buildOrg')]
        [string]
        $org,

        [parameter(HelpMessage = 'Please enter the path to your YAML file if you are using one to automate build pipelines (I.E: /azure-pipelines.yaml)',
            ValueFromPipeline,
            ParameterSetName = 'newBuild')]
        [Alias('buildPipelineYML')]
        [string]
        $ymlPath
    )

    PROCESS {

        try {
            if ($PSCmdlet.ShouldProcess($name) -and $PSBoundParameters.ContainsKey('repoType')) {
                Write-Verbose "Creating new build: $name under project: $project"
                az pipelines create --name $name `
                    --project $project `
                    --description $description `
                    --repository $repository `
                    --repository-type $repoType `
                    --branch $branch `
                    --organization $org `
                    --yml-path $ymlPath
            }
        }

        catch {
            Write-Warning 'An error has occured'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}