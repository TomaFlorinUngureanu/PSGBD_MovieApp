create FUNCTION lista_filme_filtrare_top
RETURN varchar2 as
 v_lista varchar2(32667) := '';
  v_genuri varchar2(100) := '';
BEGIN
FOR v_std_linie IN  (select * from (select f.*, trunc(avg(valoare),2) as nota from filme f join notee n on f.id=n.id_film group by f.id,f.buget,f.pagina,f.data_lansare,f.profit,f.durata,f.durata,f.limba,f.titlu,n.id_film order by avg(valoare) desc) where rownum<101) LOOP
        v_genuri :='';
        FOR v_std_linie2 IN (select * from genuri where id_film=v_std_linie.id) LOOP
        v_genuri := v_genuri||', '||v_std_linie2.gen;
        END LOOP;
        v_genuri := substr(v_genuri,3,length(v_genuri));
             v_lista := v_lista||'titlu='||v_std_linie.titlu||'^nota='|| v_std_linie.nota||'^genuri='||v_genuri||'^dataLansare='||v_std_linie.data_lansare||'^buget='||v_std_linie.buget||'^profit='||v_std_linie.profit||'^durata='||v_std_linie.durata||'^limba='||v_std_linie.limba||'^paginaWeb='||v_std_linie.pagina||'@';
    END LOOP;  
    return v_lista;
END;
/

