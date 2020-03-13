module.exports = () => {
  $(".form-control-file").change((input) => {
    input = input.target;
    if (input.files && input.files[0]) {
      let reader = new FileReader();
      reader.onload = (e) => {
        let imgData = e.target.result;
        let imgName = input.files[0].name;
        input.setAttribute("data-title", imgName);
      }
      reader.readAsDataURL(input.files[0]);
    }
  })
}