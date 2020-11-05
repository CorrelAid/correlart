library(dplyr)
library(jasmines)
library(purrr)
library(ggplot2)

ca_pal <- palette_manual(c("#acc940", "#bcd259","#96c246", "#78a972", "#6fa080", "#508994", "#3665a3", "#3c61aa", "#2d3b5a"))
cax_pal <- palette_manual(c("#f04451", "#e14e4c", "#e35564", "#b65976", "#906289", "#7b6490", "#5b669d", "#3c61aa", "#3665a3", "#254e90", "#3c3c3b"))
set.seed(2016)
seeds <- sample(1:1000, 10)

walk(seeds, function(seed) {
  use_seed(seed) %>%
    entity_heart(grain = 1000) %>%
    #unfold_slice(iterations = 23) %>%
    unfold_tempest(iterations = 25, scale = 0.01) %>% 
    style_ribbon(
      palette = cax_pal, 
      colour = "#3c3c3b", 
      background = "#3c3c3b"
    ) %>% 
    style_overlay(border = "white") +
    ggsave(paste0("cax/", seed, ".png"), width = 8, height = 8)
})



walk(seeds, function(seed) {
  use_seed(seed) %>%
    entity_heart(grain = 1000) %>%
    #unfold_slice(iterations = 23, scatter = TRUE) %>%
    unfold_tempest(iterations = 25, scale = 0.01) %>% 
    #unfold_tempest(iterations = 3, scale = 0.02) %>% 
    style_ribbon(
      palette = ca_pal, 
      colour = "#3c3c3b", 
      background = "#3c3c3b"
    ) %>% 
    style_overlay(border = "white") +
    ggsave(paste0("ca/", seed, ".png"), width = 8, height = 8)
})
