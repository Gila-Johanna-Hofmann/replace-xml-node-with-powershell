#select children you want to replace from the original node
$originalFile = [xml](Get-Content "YOUR_FILE_PATH")
$originalNode = $originalFile.SelectNodes("//YOUR_NODE_NAME")
$replace = $originalNode.ChildNodes

#remove these children from the original node
foreach($child in $replace) {
    $child.ParentNode.RemoveChild($child)
}

#select child nodes from replacement node
$replacementFile = [xml] (Get-Content "YOUR_OTHER_FILE_PATH")
$replacementNode = $replacementFile.SelectNodes("YOUR_OTHER_NODE_NAME")
$replacement = $replacementNode.ChildNodes

#import child nodes to original file and append to original node
$originalNode.AppendChild($originalNode.OwnerDocument.ImportNode($replacement, "true"))

#save original file
$originalFile.Save("YOUR_FILE_PATH")