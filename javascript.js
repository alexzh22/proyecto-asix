const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  const browser = await puppeteer.launch({ headless: false, defaultViewport: null });
  const [page] = await browser.pages(); // Usa la página abierta por defecto

  await page.goto('https://www.linkedin.com/login/');

  const data = fs.readFileSync('datos.txt', 'utf8').split('\n');
  const username = data[0].trim();
  const password = data[1].trim();

  await page.type('#username', username);
  await page.type('#password', password);

  await Promise.all([
    page.waitForNavigation(),
    page.click('.login__form_action_container button'),
  ]);

  // Aquí puedes continuar con el código de Puppeteer si es necesario
})();
