if (document.URL.match(/new/) || document.URL.match(/edit/)) {

  document.addEventListener("DOMContentLoaded", () => {
    
    const imageList = document.getElementById("image-list")

    const currentImage = document.getElementById("item-current-image");
    console.log(currentImage)


    document.getElementById("item-image").addEventListener("change", (e) => {
      const imageContent = document.querySelector("img");

      if (currentImage) {
        currentImage.remove()
      }
      if (imageContent) {
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const imageElement = document.createElement("div");
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      blobImage.setAttribute("class", "item-sample-image")

      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    })
  })
}