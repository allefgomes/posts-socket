import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

const createSocket = (topicoId)  => {
  let channel = socket.channel("comentarios:" + topicoId, {})
  channel.join()
    .receive("ok", resp => { carregaComentarios(resp.comentarios) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  document.querySelector('button').addEventListener('click', () => {
    const conteudo = document.querySelector('textarea').value;
    channel.push('comentari:add', {conteudo: conteudo})
  });

  channel.on(`comentarios:${topicoId}:new`, carregaComentario)
}

function carregaComentarios(comentarios){
  const comentariosCarregados = comentarios.map(c => {
    return template(c);
  });
  document.querySelector('.comentarios').innerHTML = comentariosCarregados.join('');
}

function carregaComentario(event){
  document.querySelector('.comentarios').innerHTML += template(event.comentario) 
}

function template(c){ return `<li>${c.conteudo}</li> `; }

export default window.createSocket = createSocket;
