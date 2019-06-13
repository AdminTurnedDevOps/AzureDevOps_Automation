function New-AZDevOpsBuild {
    [cmdletbinding()]
    param(
        [string]
        $name = 'testbb',

        [string]
        $project = ' PwshDevOps_Testing',

        [string]
        $description = 'testing builds',

        [string]
        $repository = 'PwshDevOps_Testing',

        [string]
        $repoType = 'tfsgit',

        [string]
        $branch = 'master',

        [string]
        $org = 'https://dev.azure.com/adminturneddevops',
        
        [string]
        $ymlPath = '/azure-pipelines.yml'
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
