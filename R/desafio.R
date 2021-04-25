


buscar_marmitas_veganas <- function(){

  desc <- item <- nome <- peso <- valor <- NULL

  nm <- c("nome", "desc", "peso", "valor", "add")

  "https://www.beleaf.com.br/cardapio-marmitas-veganas" %>%
    xml2::read_html() %>%
    xml2::xml_find_all("//div[contains(@class, 'product-item-details')]") %>%
    purrr::map(~ stringr::str_squish(xml2::xml_text(xml2::xml_children(.x)))) %>%
    purrr::map_dfr(~ tibble::enframe(rlang::set_names(.x, nm)), .id = "item") %>%
    tidyr::pivot_wider() %>%
    dplyr::mutate(valor = readr::parse_number(valor, locale = readr::locale(decimal_mark = ','))) %>%
    dplyr::select(item, nome, desc, peso, valor)

}



#valor = base::as.numeric(base::substr(valor,3,7))
