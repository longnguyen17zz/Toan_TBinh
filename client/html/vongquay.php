<div class="vongquay">
        <div class="vongquayMain">
            <div class="banner2">
                <img src="/BTL_Toan/client/img/banner123.png" alt="">
            </div>
             <div class="vongquay1">
             <button id="spin">Quay</button>
            <span class="arrow"><img src="/BTL_Toan/client/img/muiten123.png" alt="" class="arrow"></span>
            <div class="wapper">
                <div class="one">10k</div>
                <div class="two">40k</div>
                <div class="three">20k</div>
                <div class="four">60k</div>
                <div class="five">50k</div>
                <div class="six">70k</div>
                <div class="seven">80k</div>
                <div class="eight">100k</div>
            </div>
             </div>
        </div>
   </div>
   <script>
    let container=document.querySelector(".wapper");
    let btn = document.getElementById("spin");
    let number = Math.ceil(Math.random()*5000);

btn.onclick=function(){
    container.style.transform="rotate("+number+"deg)";
    number+=Math.ceil(Math.random()*5000);
}
   </script>