

utils::globalVariables(c('n_vitorias', 'quem_ganhou', 'temporada'))

melhor_time_temporada <- function(ano = 2003:2020){

  #n_vitorias <- quem_ganhou <- temporada <- NULL

  "https://git.io/JOqUN" %>%
    readr::read_csv2() %>%
    dplyr::group_by(temporada) %>%
    dplyr::filter(quem_ganhou != "Empate", temporada %in% c(ano)) %>%
    dplyr::count(quem_ganhou, sort = TRUE, name = "n_vitorias") %>%
    dplyr::filter(n_vitorias == base::max(n_vitorias)) %>%
    dplyr::arrange(temporada)

}
