$pasta_origem = 'C:\Users\Juliana\OneDrive\Documents\pasta_origem'
$pasta_destino_textos = 'C:\Users\Juliana\OneDrive\Documents\pasta_destino_textos'
$pasta_destino_imagens = 'C:\Users\Juliana\OneDrive\Documents\pasta_destino_imagens'
$pasta_destino_pdfs = 'C:\Users\Juliana\OneDrive\Documents\pasta_destino_pdfs'
$pasta_destino_outros = 'C:\Users\Juliana\OneDrive\Documents\pasta_destino_outros'

# Obtendo lista de arquivos na pasta de origem
$arquivos = Get-ChildItem -Path $pasta_origem

foreach ($arquivo in $arquivos) {
    $extensao = $arquivo.Extension.ToLower()

    if ($extensao -eq '.txt' -or $extensao -eq '.doc' -or $extensao -eq '.docx') {
        Move-Item -Path $arquivo.FullName -Destination $pasta_destino_textos
    }
    elseif ($extensao -eq '.jpg' -or $extensao -eq '.jpeg' -or $extensao -eq '.png' -or $extensao -eq '.gif') {
        Move-Item -Path $arquivo.FullName -Destination $pasta_destino_imagens
    }
    elseif ($extensao -eq '.pdf') {
        Move-Item -Path $arquivo.FullName -Destination $pasta_destino_pdfs
    }
    else {
        Move-Item -Path $arquivo.FullName -Destination $pasta_destino_outros
    }
}

Write-Host "Processo de movimentação de arquivos concluído."