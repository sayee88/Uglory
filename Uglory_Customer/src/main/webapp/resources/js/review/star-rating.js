 const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    console.log(target.value);
  }

