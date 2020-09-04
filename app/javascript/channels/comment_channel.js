import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="comment" >
      <p>
      <div class="comment-href">
        <p>${data.user}</p>
      </div>
      <div class="comment-bun">
        ${data.content.text}
      </div>
      </p>
    </div>`;
    const comments = document.getElementById('comments_id');
    const newComment = document.getElementById('comment_text');
    const inputElement = document.querySelector('input[name="commit"]');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    inputElement.disabled = false;
  }
});


