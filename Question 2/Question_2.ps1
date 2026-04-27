# If you don't have access to powershell on your machine, please do not hesitate to fetch the docker image to do this exercice.
# The code below is an example on how to fetch the json from the endpoint.
# Please provide the proper code to have a display that matches the question.
$Response1 = Invoke-WebRequest -URI http://jsonplaceholder.typicode.com/albums
$Response2 = Invoke-WebRequest -URI http://jsonplaceholder.typicode.com/photos

$albums = $Response1 | ConvertFrom-Json
$photos = $Response2 | ConvertFrom-Json

$PhotoHash = @{}

foreach ($album in $albums){$PhotoHash.Add($album.id,0)}

foreach ($photo in $photos ){
    $currentCount = [int] $PhotoHash[$photo.albumId]
    $PhotoHash[$photo.albumId] = ++$currentCount
}

$albumList = @()
foreach ($album in $albums) {
    $albumList += [PSCustomObject]@{
        AlbumId = $album.id
        AlbumTitle = $album.title
        PhotoCount = $PhotoHash[$album.id]
    }
}
Write-Host $albumList

$albumList | Sort-Object -Property PhotoCount -Top 5 -Descending

