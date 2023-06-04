<?php get_header(); ?>	

<section class="topo-single"></section>

<section class="secao-single">
    <div class="container">
        <div class="row">

        <?php if (have_posts()): while (have_posts()) : the_post();?> 	

            <div class="coluna-single">

                <?php if ( has_post_thumbnail() ) {  
                the_post_thumbnail( 'imagem-single' ); 
                } else { ?>  
                <img src="<?php bloginfo('template_directory'); ?>/imgs/single-img.jpg" alt="<?php the_title(); ?>" />  
                <?php } ?>

                <?php
                $the_cat = get_the_category();
                $category_name = $the_cat[0]->cat_name;
                $category_link = get_category_link( $the_cat[0]->cat_ID );     
                ?>

                <div class="cat-single" href="<?php echo esc_url( $category_link ); ?>" title="<?php $cat = get_the_category(); echo $cat[0]->cat_name; ?>"><?php $cat = get_the_category(); echo $cat[0]->cat_name; ?></div>

                <div class="box-publicado">

                    <span><svg width="14" height="15" viewBox="0 0 14 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1.20312 6C1.01172 6 0.875 6.16406 0.875 6.32812V13.4375C0.875 14.1758 1.44922 14.75 2.1875 14.75H11.8125C12.5234 14.75 13.125 14.1758 13.125 13.4375V6.32812C13.125 6.16406 12.9609 6 12.7969 6H1.20312ZM13.125 4.79688V3.8125C13.125 3.10156 12.5234 2.5 11.8125 2.5H10.5V1.07812C10.5 0.914062 10.3359 0.75 10.1719 0.75H9.07812C8.88672 0.75 8.75 0.914062 8.75 1.07812V2.5H5.25V1.07812C5.25 0.914062 5.08594 0.75 4.92188 0.75H3.82812C3.63672 0.75 3.5 0.914062 3.5 1.07812V2.5H2.1875C1.44922 2.5 0.875 3.10156 0.875 3.8125V4.79688C0.875 4.98828 1.01172 5.125 1.20312 5.125H12.7969C12.9609 5.125 13.125 4.98828 13.125 4.79688Z" fill="#AEB0B3"/>
                    </svg>&nbsp;&nbsp;<?php echo get_the_date('j F, Y'); ?></span>
                    <span class="tags"><svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M0 7.66797C0 8.02344 0.136719 8.35156 0.382812 8.59766L6.15234 14.3672C6.67188 14.8867 7.51953 14.8867 8.01172 14.3672L13.5898 8.78906C14.1094 8.29688 14.1094 7.44922 13.5898 6.92969L7.82031 1.16016C7.57422 0.914062 7.24609 0.75 6.89062 0.75H1.3125C0.574219 0.75 0 1.35156 0 2.0625V7.66797ZM3.0625 2.5C3.77344 2.5 4.375 3.10156 4.375 3.8125C4.375 4.55078 3.77344 5.125 3.0625 5.125C2.32422 5.125 1.75 4.55078 1.75 3.8125C1.75 3.10156 2.32422 2.5 3.0625 2.5Z" fill="#AEB0B3"/>
                    </svg>&nbsp;&nbsp;<?php
                    $my_tags = get_the_tags();
                    if ( $my_tags ) {
                        foreach ( $my_tags as $tag ) {
                            $tag_names[] = $tag->name;
                        }
                        echo implode( ', ', $tag_names );
                    }
					?>
                    </span>

                </div>

                <div class="content-single">

                    <h1><?php the_title(); ?></h1>

                    <span class="author-single">Autor: <?php echo get_the_author(); ?></span>

                    <?php the_content() ?> 

                </div>

            </div>

        <?php endwhile; endif;?>
           
        </div>
    </div>
</section>

<?php get_footer(); ?>	