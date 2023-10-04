<h2>🌤️ SELC ☁️</h2>
<p align="center">
  <img src="https://img.shields.io/badge/Status-FINALIZADO-white?style=for-the-badge&labelColor=red"/>
  <img src="https://img.shields.io/github/last-commit/Samuel-045/Spotify-swift/main?style=for-the-badge&labelColor=white"/>
</p>

<h2>📓 Descrição do projeto</h2>
Este projeto foi desenvolvido no hackatruck (projeto de capacitação profissional de estudantes de Instituições de Ensino 
Superior de Tecnologia da Informação, em desenvolvimento iOS para aplicativos móveis com aplicação em Internet das Coisas (IoT) )<br><br>
O projeto SELC foi elaborado como um projeto final do Hackatruck MakerSpace, englobando todos o conceitos apresentados durante o curso.<br>
O software consiste em um aplicativo de tempo, que juntamente com a previsão do tempo, há uma parte para notícias e outra para adicionar locais para saber a temperatura em tempo real, 
como a temperatura do quarto ou cozinha.<br>
Neste aplicativo há 3 telas: noticias, tempo e favoritos, cada um possui sua função específica, exemplo:<br>
  
  - Noticias : Tela reservada para as noticias relacionadas ao clima. Todas as notícias são recentes, elas foram puxadas de duas <code>API´s</code> de noticias.<br>
    Quando a notícia recebe um clique, sobe uma <code>Sheet View</code> com o conteúdo da notícia, incluindo o link externo da notícia.

    <div align="center">
      <img height=700 alt="Tela com a notícia mais recentes" src="https://github.com/Samuel-045/SELC/assets/95144250/196dee82-e55f-4a86-9779-71a2a4bbf356"/>
      
      `Tela das noticias`

      <img height="700" alt="Sheet view com dados da noticia selecionada" src="https://github.com/Samuel-045/SELC/assets/95144250/37c56d36-55eb-44dd-83af-14e401c6bc7d"/>

      `Após determinada notícia receber um clique, uma Sheet view aparece com os dados da notícia`
    </div>

  - Tempo : Tela que mostra a temperatura do local atual, e a previsão dos dias segunintes.<br>
    Na área da previsão dos próximos dias é colocado uma <code>Srool view</code> para que seja possível visualizar todos o dias disponíveis.

  <div align="center">
    <img height="700" alt="Tela com a temperatura ao vivo e previsão da semana" src="https://github.com/Samuel-045/SELC/assets/95144250/290e709d-f138-4496-baf9-c8164d48a456"/>

   `Tela com a temperatura do local em que o usuário encontra-se e com a previsão do tempo para os próximos dias` 
  </div>

  - Favoritos : Tela que faz uso do IOT, adicionando determinado local no lugar de favoritos.<br>
  A ação de colocar determinado local, por exemplo o quarto, nos favoritos, torna possível visualizar em tempo real a temperatura do quarto.
  
  <div align="center">
    <img height="700" alt="Tela dos locais Favoritos" src="https://github.com/Samuel-045/SELC/assets/95144250/d179446d-2b95-4f13-a6dc-b30ea7632010"/>

   `Tela em que ocorre o uso do IOT, possibilitando o acompanhamento em tempo real da temperatura no ambiente x (local onde o usuário encontra-se no momento)`

   <img height=700 alt="Sheet view utilizada para adicionar a localização atual aos favoritos" src="https://github.com/Samuel-045/SELC/assets/95144250/abf93450-ad52-4b5d-8127-b8ecc81dd329"/>

   `Sheet view utilizada para adicionar a localização atual aos favoritos`
  </div>

<h2>⚒️ Funcionalidades</h2>

  -`Funcionalidade 1` : Consumo de duas <code>API´s</code>, uma relacionada a temperatura/clima e outra relacionada com as notícias.
  
  -`Funcionalidade 2` : Exibição da temperatura do local presente.
  
  -`Funcionalidade 3` : Possibilidade de ver a temperatura de determinado ambiente (Uso de IOT).

<h2>✔️ Tecnologias usadas</h2>
<p>
  <img src="https://img.shields.io/badge/Swift-black?style=flat-square&logo=swift&logoColor=white"/>
  <img src="https://img.shields.io/badge/Xcode-black?style=flat-square&logo=xcode&logoColor=white"/>  
  <img src="https://img.shields.io/badge/IBM%20cloundant-black?style=flat-square&logo=IBM&logoColor=white"/>
</p>
