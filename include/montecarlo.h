#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <glm/glm.hpp>
#include "bvh.h"
#include "path.h"
#include "camera.h"
#include "light.h"


#pragma once

class MonteCarlo{

public:
	MonteCarlo(GLMmodel *_model, BVHAccel *_bvh, std::vector<Primitive> &_PrimList, 
			   PointLight *_l, AreaLight *_al, 
		       Camera *_camera, 
			   int _Width, int _Height, float _AspectRatio, int _PathSample, float _FocusDist,
			   int _PathDepth, bool _NEE_Enable);
	~MonteCarlo();

	void Render();

private:
	GLMmodel *m_model;
	BVHAccel *m_bvh;
	std::vector<Primitive> m_PrimList;

	PointLight *m_l;
	AreaLight *m_al;
	Camera *m_camera;

	int m_Width;
	int m_Height;
	int m_DirectSampleNum;
	float m_AspectRatio;
	unsigned char *m_ColorImg;
	glm::vec3 *m_Img;
	glm::vec3 *m_DirectImg;
	int m_PathSample;
	float m_FocusDist;
	int m_PathDepth;
	bool m_NEE_Enable;
};