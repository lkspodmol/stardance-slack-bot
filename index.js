require("dotenv").config();

const { App } = require("@slack/bolt");

const waitingForPigJoke = new Set();

const app = new App({
  token: process.env.SLACK_BOT_TOKEN,
  appToken: process.env.SLACK_APP_TOKEN,
  socketMode: true
});

app.command("/luk-sus-npc-ping", async ({ ack, respond }) => {
  const start = Date.now();
  await ack();
  const latency = Date.now() - start;

  await respond({
    text: `Pong!\nLatency: ${latency}ms`
  });
});

app.command("/luk-sus-npc-well", async ({ ack, respond }) => {
  await ack();

  await respond({
    response_type: "in_channel",
    blocks: [
      {
        type: "image",
        image_url: "https://media1.tenor.com/m/hl1ZCZi0yQ0AAAAd/well-in-that-case-well.gif",
        alt_text: "Well"
      }
    ]
  });
});

app.command("/luk-sus-npc-rick", async ({ ack, respond }) => {
  await ack();

  await respond({
    response_type: "in_channel",
    blocks: [
      {
        type: "image",
        image_url: "https://media1.tenor.com/m/x8v1oNUOmg4AAAAd/rickroll-roll.gif",
        alt_text: "Rick roll"
      }
    ]
  });
});

app.command("/luk-sus-npc-joke", async ({ ack, respond, command }) => {
  await ack();

  await respond({
    response_type: "ephemeral",
    text: "HAhahahaa! Good one."
  });
});

app.command("/luk-sus-npc-google", async ({ ack, respond, command }) => {
  await ack();

  await respond({
    response_type: "ephemeral",
    text: "Here you go: https://google.com"
  });
});

(async () => {
  await app.start();
  console.log("bot is running!");
})();
