<?php
set_include_path('/home/hhbd/lib/external:/home/hhbd/lib/internal');

include "Zend/Loader.php";
include "Dupa/Article.php";

$temp = new Dupa_Article();
$temp->test();

phpinfo();
