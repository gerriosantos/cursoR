

encontrar_vitorias <- function(data = data){

  temporada <- quem_ganhou <- n_vitorias <- NULL

  data <- "https://git.io/JOqUN" %>%
    readr::read_csv2() %>%
    dplyr::group_by(temporada, quem_ganhou) %>%
    dplyr::filter(quem_ganhou != "Empate") %>%
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::ungroup() %>% tidyr::pivot_wider(names_from = quem_ganhou, values_from = n_vitorias)
}
