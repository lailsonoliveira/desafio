<?php get_header(); ?>	

<section class="secao-page">
    <div class="container">
        <div class="row-interna">	

        <?php if (have_posts()): while (have_posts()) : the_post();?> 	

            <div class="coluna-page">   

            <h1><?php the_title(); ?></h1>                    

            <?php the_content() ?>   

            </div>

        <?php endwhile; endif;?>
           
        </div>
    </div>
</section>

<?php get_footer(); ?>	