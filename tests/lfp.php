<?php
include "html_parse.php";
pg_connect("user=fred password=fred");

for($startId = 13396; $startId<50000; $startId++) {

    $url = "http://www.lfp.fr/ligue1/feuille_match/$startId";
    echo "Parsing $url\n";
    $haveFirst = false;

    $lines = file($url);

    for($i=0; $i<count($lines); $i++) {
        $matchs = [];
        
        if (preg_match('#<h1 class="confrontation">Feuille de match <span>([^-]*)-([^<]*)</span></h1>#', $lines[$i], $matchs)) {
            $club1 = trim($matchs[1]);
            $club2 = trim($matchs[2]);

            if (preg_match('#<p>Saison ([^/]*)/([^ ]*) - <a href="/ligue1/calendrier_resultat\?sai=([^&]*)&jtr=([^"]*)">([^<]*)</a></p>#', $lines[$i+1], $matchs)) {
                $startYear = $matchs[1];
                $endYear = $matchs[2];
                $saisonId = $matchs[3];
                $roundId = $matchs[4];
                $strRound = $matchs[5];

                if (preg_match('#<p>([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) - </p>#',$lines[$i+2],$matchs)) {
                    $strJour = $matchs[1];
                    $strNbJour = $matchs[2];
                    $strMois = $matchs[3];
                    $strAnnee = $matchs[4];
                }
                else {
                    echo "ERROR 1 : $url\n";
                    exit;
                }
            }
            else {
                echo "ERROR 2: $url\n";
                exit;
            }
        }
        elseif (preg_match('#<input type="hidden" id="match_id_hidden" value="([^"]*)"/>#',$lines[$i],$matchs)) {
            $externalMatchId = $matchs[1];
        }
        elseif (preg_match('#<input type="hidden" id="dom_id_hidden" value="([^"]*)"/>#',$lines[$i],$matchs)) {
            $externalTeamId1 = $matchs[1];
        }
        elseif (preg_match('#<input type="hidden" id="ext_id_hidden" value="([^"]*)"/>#',$lines[$i],$matchs)) {
            $externalTeamId2 = $matchs[1];
        }
        elseif (preg_match('#<span class="buts">([^<]*)</span>#',$lines[$i],$matchs)) {
            $but = $matchs[1];
            if ($haveFirst) {
                $but2 = $matchs[1];
                $haveFirst = false;
            }
            else {
                $but1 = $matchs[1];
                $haveFirst = true;
            }
        }
    }
    $sql = "insert into lfp (club1,club2,startYear,endYear,saisonId,roundId,strround,strjour,strnbjour,strmois,strannee,externalmatchid,externalteamid1,externalteamid2,but1,but2) values (".pg_escape_literal($club1).",".pg_escape_literal($club2).",".pg_escape_literal($startYear).",".pg_escape_literal($endYear).",".pg_escape_literal($saisonId).",".pg_escape_literal($roundId).",".pg_escape_literal($strRound).",".pg_escape_literal($strJour).",".pg_escape_literal($strNbJour).",".pg_escape_literal($strMois).",".pg_escape_literal($strAnnee).",".pg_escape_literal($externalMatchId).",".pg_escape_literal($externalTeamId1).",".pg_escape_literal($externalTeamId2).",".pg_escape_literal($but1).",".pg_escape_literal($but2).")";
    pg_query($sql);
}

exit;

// Warning: file(http://www.lfp.fr/ligue1/feuille_match/13368): failed to open stream: HTTP request failed! HTTP/1.1 404 Not Found in /home/www/manafoot.com/tests/lfp.php on line 11

/*
<div id="contenus">
                                        <div class="box match_stats">
          <div class="box_top"></div>
          <div class="contenu_box match_stats">
                <h1 class="confrontation">Feuille de match <span>CA Paris - AS Cannes</span></h1>
            <p>Saison 1933/1934 - <a href="/ligue1/calendrier_resultat?sai=2&jtr=1">1ère journée</a></p>
                <p>Samedi 01 juillet 1933 - </p>
            <p>


                <script type="text/javascript">
    $(document).ready(function(){
                chargeOngletsFeuilleMatch(["statsMatch","statsJoueursMatch", "videoMatch",]);
         });
</script>
<input type="hidden" id="match_id_hidden" value="181"/>
<input type="hidden" id="dom_id_hidden" value="16"/>
<input type="hidden" id="ext_id_hidden" value="124"/>
<input type="hidden" id="live_hidden" value="0"/>
<input type="hidden" id="dom_nom_club_hidden" value="CA+Paris"/>
<input type="hidden" id="ext_nom_club_hidden" value="AS+Cannes"/>

<div class="score">
    <div style="background-image: url(/images/photos/clubs/logo/grand/100039.png);background-size:80px 80px;" class="club_dom">
        <span class="club">CA Paris</span>
                        <span class="buts">5</span>

    </div>
    <div style="background-image: url(/images/photos/clubs/logo/grand/500117.png);background-size:80px 80px;" class="club_ext">
        <span class="club ">AS Cannes</span>
                                <span class="buts">1</span>

    </div>
    <div class="clear"></div>

<p class="periode">

*/

