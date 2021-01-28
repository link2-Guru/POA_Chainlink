


const HDWalletProvider = require('@truffle/hdwallet-provider');
const Web3 = require('Web3')
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();
const path = require('path')

// 设置sokol网络的RPC
const provider = new HDWalletProvider(mnemonic, 'https://sokol.poa.network')

const web3 = new Web3(provider)


const jsonFile = "../build/contracts/Price.json";

// console.log('path', path.resolve(__dirname, jsonFile))
let rawdata = fs.readFileSync(path.resolve(__dirname, jsonFile));
const json = JSON.parse(rawdata);
// console.log(json);

const priceABI = json.abi;

const priceInstance = new web3.eth.Contract(priceABI, "") // 合约地址

const account = web3.eth.accounts.create(mnemonic);
console.log('account', account)


priceInstance.methods.getPrice().call({
    from: "" // 钱包地址
}).then((res, data) => {
    console.log('res', res)
    console.log('data', data)
})