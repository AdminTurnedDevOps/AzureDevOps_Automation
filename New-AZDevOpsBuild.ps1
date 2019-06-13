
#New-AZDevOpsBuild -name 'testbb' -project 'PwshDevOps_Testing' -description 'testing builds' -repository 'PwshDevOps_Testing' -repoType 'tfsgit' -branch 'master' -org 'https://dev.azure.com/adminturneddevops' -ymlPath '/azure-pipelines.yml'
function New-AZDevOpsBuild {
    [cmdletbinding()]
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