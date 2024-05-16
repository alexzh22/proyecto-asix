const http = require('http');
const puppeteer = require('puppeteer');
const fs = require('fs');

//ESTO ES PARA QUE SALGA PANTALLA MAXIMIZADA
const server = http.createServer(async (req, res) => {
  const browserVisible = await puppeteer.launch({ 
    headless: false,
    defaultViewport: null, 
    args: ['--start-maximized'] // abrirr navegador maximizado.
  });
//hasta aqui lo de maximizar pantalla
  
  const [pageVisible] = await browserVisible.pages();

  await pageVisible.goto('http://linkedin/feed'); 

  const data = fs.readFileSync('datos.txt', 'utf8').split('\n');
  const user_linke = data[0].trim();
  const contra_linke = data[1].trim();

  const browser = await puppeteer.launch({ headless: true, defaultViewport: null });
  const [page] = await browser.pages();

  await page.goto('https://www.linkedin.com/login/');
  await page.type('#username', user_linke);
  await page.type('#password', contra_linke);

  await Promise.all([
    page.waitForNavigation(),
    page.click('.login__form_action_container button'),
  ]);

  const cookies = await page.cookies();
  fs.writeFileSync('cookies.json', JSON.stringify(cookies));

  await browser.close();

  const cookiesString = fs.readFileSync('cookies.json', 'utf8');
  const cookiesForPage = JSON.parse(cookiesString);
  await pageVisible.setCookie(...cookiesForPage);

  await pageVisible.goto('https://www.linkedin.com');

});

server.listen(3086, () => console.log('Servidor iniciado en el puerto 3086'));
