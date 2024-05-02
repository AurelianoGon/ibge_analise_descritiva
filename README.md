# Banco de Dados do IBGE - Análise Descritiva
Este repositório contém um banco de dados fornecido pelo Instituto Brasileiro de Geografia e Estatística (IBGE), juntamente com uma análise descritiva detalhada e análises de relação entre variáveis realizadas sobre os dados.

### Descrição do Banco de Dados
O banco de dados do IBGE contém informações demográficas, socioeconômicas e geográficas sobre uma determinada população. Os dados foram coletados através de pesquisas e censos realizados pelo IBGE e estão disponíveis para uso público.

### Estrutura do Banco de Dados
O banco de dados está estruturado em 7 variáveis e 76840 registros, cada uma representando uma categoria específica de informações. Logo inclue:

- **Cor:** Amarela, Branca, Parda, Preta, Indígena; 
- **Idade:** 0 a 100 anos;
- **Anos de Estudo:** tempo de escolaridade;
- **Renda:** Dados relacionados à renda individual e familiar;
- **Sexo:** Masculino e Feminino;
- **Altura:** tamanho de cada indivíduo entrevistado;
- **Estado(UF):**.

### Análise Descritiva

A análise descritiva realizada sobre os dados teve como objetivo fornecer insights sobre a realidade da população disponível no banco de dados. Algumas análises incluem:

- Distribuição da população por idade e sexo.
- Níveis de escolaridade e sua relação com a renda.
- Distribuição de Frequência de algumas variáveis (categorias).
- Medidas de Tendência Central.
- Medidas de Dispersão.
- Histogramas e Boxplots.
- Correlação.
Essas foram algumas análises estatísticas que realizamos com base nas variáveis fornecidas.

----------------------------------

Iniciamos uma análise básica da variável Renda, onde buscamos calcular sua média, mediana, mínimo, máximo e desvio padrão.
Abaixo está um gráfico de barras representando a frequência das classes sociais presentes no conjunto de dados. Ao observarmos o gráfico, torna-se evidente que a classe E (considerada com menos poder aquisitivo) é a classe predominante.
Já a classe A (considerada com maior poder aquisitivo) é bastante reduzida. Portanto, é possível observar uma desigualdade social significativa.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/38257779-8319-4e15-91a8-706015c2f6a4)

 
Ao examinarmos a MODA da variável Renda, obtivemos o valor de (788), que corresponde ao salário-mínimo da época. Isso confirma os resultados do gráfico.

----------------------------------------------

Em seguida, realizou-se Histogramas das variáveis Quantitativas como:

**Idade** (conclui-se que a grande maioria das pessoas entrevistadas está na faixa etária entre 30 e 60 anos, com um pico significativo aos 40 anos).

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/76c45755-83fb-4188-978e-fc17f567945f)

 ------------------------------------------
 
**Altura** (observa-se que a altura média, representada pelo pico, da maioria das pessoas entrevistadas é de 1,70 metros).

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/d54398a7-55cd-4ed9-9e54-059b85c6a37d)

-------------------------------------------

**Renda** (observa-se que uma parte significativa dos entrevistados recebe o salário-mínimo).

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/ff8d179e-22ab-44f1-b707-a5f2015bc13e)

-------------------------------------- 

Segue abaixo um histograma representando as pessoas cuja renda é inferior a 20.000. Notavelmente, observa-se que a proporção de indivíduos com renda superior a 5.000 é bastante reduzida.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/853b5cb5-2d32-4577-9e62-afca023319ee)

--------------------------------------------

### Análise de Relação entre variáveis.
O gráfico abaixo apresenta o resultado da análise de relação entre as variáveis Sexo e Cor. Logo, é possível constatar que a cor Parda e Branca tiveram predominância entre os entrevistados.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/ecf3980b-bd20-4952-9e38-d0b6c391531f)

------------------------------------

Em seguida, foi realizada uma análise para obter-se a MÉDIA da variável Renda em relação as variáveis Cor e Sexo.

E com o resultado dessa análise observou-se que a Cor Amarela - tanto no masculino quanto no feminino - possui uma renda superior em relação às outras cores.
Outra observação interessante deste resultado é que a renda das mulheres indígenas é superior a dos homens, algo incomum em relação as outras categorias.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/8f78fd01-e8e8-4e2b-9562-a90f3642a314)

-----------------------------------

Ao examinar a mediana dessas variáveis, a conclusão permanece a mesma.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/496b0641-2a91-4a9c-9b85-fd07abd662a9)

-----------------------------------------------

**Máximo** e **Variância** da variável Renda segundo Sexo e Cor. 

Sabemos que a variância é uma medida que indica o quão dispersos os valores de um conjunto de dados estão em relação à média.
Esses números indicam a dispersão dos valores de renda dentro de cada categoria. Uma variância maior sugere que os valores de renda estão mais espalhados em torno da média, enquanto uma variância menor indica que os valores estão mais agrupados em torno da média. Logo, fica evidente como nas análises anteriores uma dispersão relevante do sexo feminino da categoria indígena.


![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/aaef9fd6-c150-4440-ab79-82df8b3c6630)

----------------------------------------- 

**Desvio padrão** da variável renda segundo Sexo e Cor.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/deb221ae-0114-4fac-a3d8-ff252cd01f6b)

----------------------------------------

### "Box plot"
"Uma análise mais detalhada foi conduzida utilizando Box plot para a variável Renda, considerando apenas as pessoas com renda inferior a 10.000, em relação às variáveis Cor e Sexo."

Os resultados continuam semelhantes às anteriores.

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/188d38e2-c485-47b1-8b8f-53f1fe8b4507)
 
--------------------------------------

Durante a análise, a título de curiosidade, foi utilizada uma função para determinar o valor MÁXIMO ganho por 99% das pessoas no conjunto de dados, sendo este de 1.500,00, equivalente a dois salários-mínimos.

---------------------------------------------------

Quando plotamos o boxplot da variável Renda em relação às variáveis Anos de Estudo e Sexo, observamos que mulheres, mesmo com o mesmo nível de estudo ou superior, tendem a ter salários inferiores aos dos homens. 

![image](https://github.com/AurelianoGon/ibge_analise_descritiva/assets/106711467/e7a46bcc-1bb5-4f38-82a0-a931f0415e70)

--------------------------------------------------

Em suma, esses dados revelam disparidades complexas e interseccionais de renda entre diferentes grupos étnicos e de gênero, destacando a necessidade de políticas e iniciativas que abordem essas desigualdades de forma holística e inclusiva.

--------------------------------------------------------------

## Como Utilizar
Você pode utilizar este banco de dados e a análise descritiva para diversos fins, incluindo pesquisa acadêmica, desenvolvimento de políticas públicas, e análise de mercado. 

Para utilizar os dados, basta fazer o download dos arquivos neste repositório e importá-los para a sua ferramenta de análise de dados preferida.

----------------------------------------------------------

## Contribuições

Contribuições são bem-vindas! Se você encontrar algum problema nos dados ou tiver sugestões para melhorias na análise, sinta-se à vontade para abrir uma issue ou enviar um pull request.

---------------------------------------------------------------------

## Agradecimentos
Agradecemos ao Instituto Brasileiro de Geografia e Estatística (IBGE) por disponibilizar os dados utilizados neste projeto.

-------------------------------------------------------------------------

## Contato
Para mais informações, entre em contato com brunnamian@gmail.com.
