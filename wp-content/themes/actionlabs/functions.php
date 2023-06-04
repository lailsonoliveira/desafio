<?php

/************* Limite de Palavras Resumidas ****************/
function excerpt($limit) {
    $excerpt = explode(' ', get_the_excerpt(), $limit);
    if (count($excerpt)>=$limit) {
        array_pop($excerpt);
        $excerpt = implode(" ",$excerpt).'...';
    } else {
        $excerpt = implode(" ",$excerpt);
    }
    $excerpt = preg_replace('`\[[^\]]*\]`','',$excerpt);
    return $excerpt;
    }

/*************** suporte a imagens de destaques **************/

add_theme_support( 'post-thumbnails' ); 
add_image_size('imagem-loopblog', 370, 277, true);
add_image_size('imagem-single', 692, 407, true);