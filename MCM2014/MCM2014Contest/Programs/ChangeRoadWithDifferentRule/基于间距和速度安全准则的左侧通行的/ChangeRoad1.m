%3,换道模型  (基于靠左行的)
 function  vihcle_space=ChangeRoad(i,j,cell,roadVihcleNumChain,basicInfor,vihcle_space,probily,istep)
 %% set parameters
dsafe=3;
 
 
 %% 初始化变量
 if j>1
     CellFront=vihcle_space.position(roadVihcleNumChain(i,j-1))-vihcle_space.position(roadVihcleNumChain(i,j))-1;
 else
     CellFront=basicInfor.cells-vihcle_space.position(roadVihcleNumChain(i,j))-1;
 end
 if i>1
     CellLeftFront=cellLeftFront(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%查找左车道与前车的距离
     CellLeftBack=cellLeftBack(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%查找左车道与后车的距离
 else
     CellLeftFront=-2;
     CellLeftBack=-2;
 end
 if i<basicInfor.road
     CellRightFront=cellRightFront(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%查找右车道与前车的距离
     CellRightBack=cellRightBack(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%查找右车道与后车的距离
 else
     CellRightFront=-2;
     CellRightBack=-2;
 end
 
 %% 变道
 ChangeFrame=0;
 if  (CellLeftFront>vihcle_space.v(roadVihcleNumChain(i,j)))...
         &&(CellLeftBack>=dsafe)
     rand('state',sum(100*clock)*rand(1));%定义随机种子
     p_rand=rand;%产生随机概率
     if p_rand<probily.Cprobily(1+vihcle_space.v_frame(roadVihcleNumChain(i,j)))+0.5
            vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j))-1;
            vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
            ChangeFrame=1;%向左换道
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
            ChangeFrame=0;
     end
 else if (ChangeFrame==0)&&(vihcle_space.v(roadVihcleNumChain(i,j))>CellFront)...
             &&(CellRightFront>vihcle_space.v(roadVihcleNumChain(i,j)))...
             &&(CellRightFront>CellFront)&&(CellRightBack>=dsafe)
      rand('state',sum(100*clock)*rand(1));%定义随机种子
      p_rand=rand;%产生随机概率
     if p_rand<probily.Cprobily(1+vihcle_space.v_frame(roadVihcleNumChain(i,j)))-0.3
            vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j))+1;%向右换道
            vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     end
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     end
 end