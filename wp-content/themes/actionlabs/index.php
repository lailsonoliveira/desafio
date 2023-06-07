<?php get_header(); ?>	

<section class="topo-blog">
    <div class="container">
        <h1>Portal do Cliente</h1>
    </div>
</section>

<section class="secao-posts">
    <div class="container">
        <div class="row">

            <?php
            $args = array(
                'post_type' => 'post',                                   
                'orderby' => 'date',
                'order' => 'DESC',
                'showposts' => 6  
            );
            $query = new WP_Query( $args );
            
            if($query->have_posts()) :
               
                while($query->have_posts()) : $query->the_post() ?>
            
                <div class="colunas-blog">

                    <div class="card-blog">

                        <a href="<?php the_permalink();?>" title="<?php the_title(); ?>">

                            <?php if ( has_post_thumbnail() ) {  
                            the_post_thumbnail( 'imagem-loopblog' ); 
                            } else { ?>  
                            <img src="<?php bloginfo('template_directory'); ?>/imgs/imagem-padrao.jpg" alt="<?php the_title(); ?>" />  
                            <?php } ?>	

                        </a>  
                        
                        <?php
                            $the_cat = get_the_category();
                            $category_name = $the_cat[0]->cat_name;
                            $category_link = get_category_link( $the_cat[0]->cat_ID );     
                        ?>
                        <div class="cat-blog"><?php $cat = get_the_category(); echo $cat[0]->cat_name; ?></div>
                        
                        <a class="box-resumo" href="<?php the_permalink();?>" title="<?php the_title(); ?>">
                        
                            <h2><?php the_title(); ?></h2>
                                    
                            <p><?php echo excerpt(26); ?></p>
                            
                            <span>LEIA MAIS »</span>

                        </a>   

                    </div>
                
                </div>
                
            <?php endwhile; endif;
            wp_reset_postdata(); ?>    
        </div>
    </div>
</section>

<?php get_footer(); ?>	
