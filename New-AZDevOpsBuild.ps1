function New-AZDevOpsBuild {
    [cmdletbinding(SupportsShouldProcess, DefaultParameterSetName = 'newBuild', ConfirmImpact = 'high')]
    param(
        [string]
        $name,

        [string]
        $project,

        [string]
        $description,

        [string]
        $repository,

        [string]
        $repoType,

        [string]
        $branch,

        [string]
        $org,
        
        [string]
        $ymlPath
    )
    az pipelines create --name $name `
        --project $project `
        --description $description `
        --repository $repository `
        --repository-type $repoType `
        --branch $branch `
        --organization $org `
        --yml-path $ymlPath

}