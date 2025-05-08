import { createConsumer } from "@rails/actioncable";
import "./chat_messages_channel";

export default createConsumer();

// Import all channels
const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);