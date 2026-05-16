package core

type YoMamaError struct {
	IsYoMamaError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewYoMamaError(code string, msg string, ctx *Context) *YoMamaError {
	return &YoMamaError{
		IsYoMamaError: true,
		Sdk:              "YoMama",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *YoMamaError) Error() string {
	return e.Msg
}
